package org.audioshop.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.CartDTO;
import org.audioshop.domain.MemberVO;
import org.audioshop.domain.OrderCancelDTO;
import org.audioshop.domain.OrderDTO;
import org.audioshop.domain.OrderItemDTO;
import org.audioshop.domain.OrderPageItemDTO;
import org.audioshop.mapper.AudioDramaAttachMapper;
import org.audioshop.mapper.AudioDramaMapper;
import org.audioshop.mapper.CartMapper;
import org.audioshop.mapper.MemberMapper;
import org.audioshop.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service 
@AllArgsConstructor  
@Log4j
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private AudioDramaAttachMapper attachMapper; 
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private AudioDramaMapper audiodramaMapper;
	
	
	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {

		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();		
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getAuId());			

			goodsInfo.setAuCount(ord.getAuCount());	
			
			goodsInfo.initSaleTotal();
			
			//List<AttachFileDTO> imageList = attachMapper.getAttachList(goodsInfo.getAuId());
			
			//goodsInfo.setImageList(imageList);			
			
			result.add(goodsInfo);			
		}		
		
		return result;
		
	}


	@Override
	@Transactional
	public void order(OrderDTO ord) {

		/* 사용할 데이터가져오기 */
			/* 회원 정보 */
			MemberVO member = memberMapper.getMemberInfo(ord.getUsername());
			/* 주문 정보 */
			List<OrderItemDTO> ords = new ArrayList<>();
			for(OrderItemDTO oit : ord.getOrders()) {
				OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getAuId());
				// 수량 셋팅
				orderItem.setAuCount(oit.getAuCount());
				// 기본정보 셋팅
				orderItem.initSaleTotal();
				//List객체 추가
				ords.add(orderItem);
			}
			/* OrderDTO 셋팅 */
			ord.setOrders(ords);
			ord.getOrderPriceInfo();
			
		/*DB 주문,주문상품(,배송정보) 넣기*/
			
			/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
			String orderId = member.getUsername() + format.format(date);
			ord.setOrderId(orderId);
			
			/* db넣기 */
			orderMapper.enrollOrder(ord);		//vam_order 등록
			for(OrderItemDTO oit : ord.getOrders()) {		//vam_orderItem 등록
				oit.setOrderId(orderId);
				orderMapper.enrollOrderItemSelectKey(oit);			
			}

		/* 비용 포인트 변동 적용 */
			
			/* 비용 차감 & 변동 돈(money) Member객체 적용 */
			int calMoney = member.getMoney();
			calMoney -= ord.getOrderFinalSalePrice();
			member.setMoney(calMoney);
			
			/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
			int calPoint = member.getPoint();
			calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
			member.setPoint(calPoint);
				
			/* 변동 돈, 포인트 DB 적용 */
			orderMapper.deductMoney(member);
			
		/* 재고 변동 적용 */
			for(OrderItemDTO oit : ord.getOrders()) {
				/* 변동 재고 값 구하기 */
				AudioDramaVO audiodrama = audiodramaMapper.getGoodsInfo(oit.getAuId());
				audiodrama.setAuQuantity(audiodrama.getAuQuantity() - oit.getAuCount());
				/* 변동 값 DB 적용 */
				orderMapper.deductStock(audiodrama);
			}			
			
		/* 장바구니 제거 */
			for(OrderItemDTO oit : ord.getOrders()) {
				CartDTO dto = new CartDTO();
				
				log.info("dto1: " + dto);
				dto.setUsername(ord.getUsername());
				dto.setAuId(oit.getAuId()); 
				
				cartMapper.deleteOrderCart(dto);

				log.info("장바구니 삭제 완료.");
				log.info("dto2: " + dto);
			}			
	 
		
	}

	/* 주문취소 */
	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO dto) {
		
	/* 주문, 주문상품 객체 */
		/*회원*/
			MemberVO member = memberMapper.getMemberInfo(dto.getUsername());
		/*주문상품*/
			List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrderId());
			for(OrderItemDTO ord : ords) {
				ord.initSaleTotal();
			}
		/* 주문 */
			OrderDTO orw = orderMapper.getOrder(dto.getOrderId());
			orw.setOrders(ords);
			
			orw.getOrderPriceInfo();
			
	/* 주문상품 취소 DB */
			orderMapper.orderCancel(dto.getOrderId());
			
	/* 돈, 포인트, 재고 변환 */
			/* 돈 */
			int calMoney = member.getMoney();
			calMoney += orw.getOrderFinalSalePrice();
			member.setMoney(calMoney);
			
			/* 포인트 */
			int calPoint = member.getPoint();
			calPoint = calPoint + orw.getUsePoint() - orw.getOrderSavePoint();
			member.setPoint(calPoint);
			
				/* DB적용 */
				orderMapper.deductMoney(member);
				
			/* 재고 */
			for(OrderItemDTO ord : orw.getOrders()) {
				AudioDramaVO audiodrama = audiodramaMapper.read(ord.getAuId());
				audiodrama.setAuQuantity(audiodrama.getAuQuantity() + ord.getAuCount());
				orderMapper.deductStock(audiodrama);
			}		
		
		
	}
	
	
	
	
}

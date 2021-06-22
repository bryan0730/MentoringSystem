package com.hustar.mentoring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class MentoringNoticeHandler extends TextWebSocketHandler{
   
   List<WebSocketSession> sessions = new ArrayList<>();
   Map<String, WebSocketSession> userSession = new HashMap<>();
   
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      // TODO Auto-generated method stub
      System.out.println("웹소켓 연걸 : "+session);
      sessions.add(session);
      String senderId = getId(session);
      System.out.println("웹소켓 연결 :: getId : "+senderId);
      userSession.put(senderId, session);
   }
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      // TODO Auto-generated method stub
      System.out.println("웹소켓 메세지 : "+message);
      String senderId = getId(session);
      
      String msg = message.getPayload();
      if (msg != null) {
         String[] strs = msg.split(",");
         if (strs != null && strs.length == 4) {
            String cmd = strs[0];
            String sender = strs[1];
            String receiver = strs[2];
            String role = strs[3];
            
            
            WebSocketSession receiverSession = userSession.get(sender);
            TextMessage tmpMsg = null;
            if ("reservation".equals(cmd) && receiverSession != null) {
               if(role=="ROLE_MEMBER") {
                  tmpMsg = new TextMessage(receiver + "님이  멘토링을 예약하셨습니다.");
               }else if(role == "ROLE_MENTO") {
                  tmpMsg = new TextMessage(receiver + "님이  멘토링을 수락하셨습니다.");
               }
               
               receiverSession.sendMessage(tmpMsg);
            }
         }
      }
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      // TODO Auto-generated method stub
      System.out.println("웹소켓 종료 : "+status);
      
   }
   
   private String getId(WebSocketSession session) {
      Map<String, Object> httpSession = session.getAttributes();
      String userId = (String) httpSession.get("name");
      System.out.println("웹소켓 userId :::::: "+userId);
      
      if(null == userId) {
         return session.getId();
      }else {
         return userId;
      }   
   }
   
}
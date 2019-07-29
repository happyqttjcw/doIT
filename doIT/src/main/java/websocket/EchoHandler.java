package websocket;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	//Set : �ߺ��Ұ�
	private Set<WebSocketSession> clients = new HashSet<WebSocketSession>();

	@Override //����� ���
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		System.out.println("Ŭ���̾�Ʈ ���ӵ�");
		clients.add(session);
	}

	@Override //�޽��� ����
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String loadMessage = (String)message.getPayload();
		System.out.println("������ ������ �޽��� : " + loadMessage);
		clients.add(session);
		//�ٸ� Ŭ���̾�Ʈ���� �޽��� ����
		for(WebSocketSession s : clients) {
			s.sendMessage(new TextMessage(loadMessage));
		}
	}

	@Override //���� �߻� ��
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("���� �߻� : " + exception.getMessage());
	}

	@Override //���� ����
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println("Ŭ���̾�Ʈ ���� ���� : " + status.getReason());
	}
	
	
}

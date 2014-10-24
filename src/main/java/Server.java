

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ws")
public class Server {
	
	static List<Session> conns = new ArrayList<Session>();
	
	@OnMessage
	public void msg(Session s, final String msg){
		System.out.println(msg);
		for(Session session : conns){
			try {
				session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
//		final Session ss = s;
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				try {
//					Thread.sleep(2000);
//				} catch (IOException e) {
//					e.printStackTrace();
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//				
//			}
//		}).start();
//		return "you say : ".concat(msg);
	}
	
	@OnOpen
	public void conn(Session session){
		conns.add(session);
		System.out.println(session);
		System.out.println(session.getId() + " connected..");
	}
	
	@OnClose
	public void close(Session s){
		System.out.println(s.getId() + " closed..");
	}
	
	@OnError
	public void error(Throwable t){
		System.out.println("error");
	}
	

}

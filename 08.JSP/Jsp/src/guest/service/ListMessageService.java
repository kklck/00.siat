package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	private ListMessageService(){}
	
	public static ListMessageService getInstance() throws MessageException{
		if( instance == null ){
			instance = new ListMessageService();
		}
		return instance;
	}
	
	
	public List <Message> getMessageList() throws MessageException{
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList();	
		return mList;
	}
	public List <Message> getMessageList(String firstRow, String endRow) throws MessageException{
		// 전체 레코드를 검색해 온다면
		int first = Integer.parseInt(firstRow);
		int end = Integer.parseInt(endRow);
		List <Message> mList = MessageDao.getInstance().selectList(first, end);	
		return mList;
	}
	public List <Message> getMessageList(String pNum) throws MessageException{
		// 전체 레코드를 검색해 온다면
		int pageNum = 1;
		if(pNum != null) {
			pageNum = Integer.parseInt(pNum);
		}
		int end = pageNum*countPerPage;
		int first = end - (countPerPage - 1);
		List <Message> mList = MessageDao.getInstance().selectList(first, end);	
		return mList;
	}
	
	public double getTotalRec() throws MessageException {
		totalRecCount = MessageDao.getInstance().getTotalCount();
		return totalRecCount;
	}
	public int getTotalPage() throws MessageException {
		double t =  Math.ceil(getTotalRec()/countPerPage);
		pageTotalCount = (int)t;
		return pageTotalCount;
	}
	public int getCountPerPage(){
		return countPerPage;
	}
	
}

package ex5_autowired;

import java.io.FileWriter;

public class OutputerImple implements Outputer {
	
	private String path;
	
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public void wirteMessage(String msg) throws Exception {
		FileWriter f = new FileWriter(path); //파일이 만들어 지고 
		f.write(msg);//그곳에 저장?
		f.close();
	}

}

package dto;

public class MemberBuyDTO {
	private String id;
	private int getIntro;
	private int getjava;
	private int getC;
	
	public MemberBuyDTO(String id, int getIntro, int getjava, int getC) {
		this.id = id;
		this.getIntro = getIntro;
		this.getjava = getjava;
		this.getC = getC;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGetIntro() {
		return getIntro;
	}
	public void setGetIntro(int getIntro) {
		this.getIntro = getIntro;
	}
	public int getGetjava() {
		return getjava;
	}
	public void setGetjava(int getjava) {
		this.getjava = getjava;
	}
	public int getGetC() {
		return getC;
	}
	public void setGetC(int getC) {
		this.getC = getC;
	}
	
}

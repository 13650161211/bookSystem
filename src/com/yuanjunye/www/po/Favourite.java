package com.yuanjunye.www.po;

/**
 * 学生收藏夹模型
 * @author hasee
 *
 */
public class Favourite {
	
	private int id;
	private String bookId;
	private String uerName;
	
	/**
	 * 无参构造
	 */
	public Favourite() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getUerName() {
		return uerName;
	}

	public void setUerName(String uerName) {
		this.uerName = uerName;
	}
	
	
}

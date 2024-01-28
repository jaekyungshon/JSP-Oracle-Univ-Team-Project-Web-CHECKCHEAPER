package checkCheaper;

public class UserRepository {
	private String userId = null;
	
	private static UserRepository instance = new UserRepository();
	
	public static UserRepository getInstance() {
		return instance;
	}
	
	public void setId(String s) {
		userId=s;
	}
}

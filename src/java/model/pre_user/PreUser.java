package model.pre_user;

public class PreUser {
    
    private int id;
    private String email;
    private String typeC;
    private int typeN;
    private String commentary;
    private boolean active;

    public PreUser() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTypeC() {
        return typeC;
    }

    public void setTypeC(String typeC) {
        this.typeC = typeC;
    }

    public int getTypeN() {
        return typeN;
    }

    public void setTypeN(int typeN) {
        this.typeN = typeN;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    
}

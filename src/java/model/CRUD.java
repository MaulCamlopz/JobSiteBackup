package model;

public interface CRUD {
    public boolean create(Object object);
    public Object read(int id);
    public boolean update(Object object);
    public boolean delete(int id);
}

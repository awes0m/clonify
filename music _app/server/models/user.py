#extract data thats comming from the user
from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary
from models.base import Base


class User(Base):
    """Represents a user in the music application.

    Stores user information such as ID, name, email, and password.
    """
    __tablename__ = 'users'
    id = Column(TEXT,primary_key=True,index=True)
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100))
    #hash the password
    password = Column(LargeBinary)
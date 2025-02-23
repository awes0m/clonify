import bcrypt
from uuid import uuid4
from fastapi import Depends, HTTPException,APIRouter
from sqlalchemy.orm import Session

from database import get_db
from models.user import User
from pydantic_schemas.user_create import UserCreate
from pydantic_schemas.user_login import UserLogin

router = APIRouter()

@router.post('/signup',status_code=201)
def signup_user(user: UserCreate,db: Session = Depends(get_db)):
        #check if the user already exist
        user_db = db.query(User).filter(User.email == user.email).first()
        if user_db:
            raise HTTPException(status_code=400,detail='User already exist')
        #else store the user
        hassed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt(16))
        user_db = User(id=str(uuid4()) ,name=user.name,email=user.email,password=hassed_password)
        db.add(user_db)
        db.commit()
        db.refresh(user_db)
        #return the user
        return user_db
    

@router.post('/login')
def login_user(user: UserLogin,db: Session = Depends(get_db)):
        user_db = db.query(User).filter(User.email == user.email).first()
        #check if the user in db
        if not user_db: 
            raise HTTPException(status_code=400,detail='User does not exist')
        #check if the password is correct
        if not bcrypt.checkpw(user.password.encode('utf-8'),user_db.password):
            raise HTTPException(status_code=400,detail='Invalid password')
        return user_db
        
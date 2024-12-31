from fastapi import Depends
from sqlalchemy.orm import Session

from src.domain.repositories.user import UserRepository
from src.providers.infra.database import get_db_session

def get_user_repository(db: Session = Depends(get_db_session)) -> UserRepository:
    return UserRepository(db)
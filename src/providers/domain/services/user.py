from fastapi import Depends

from src.domain.repositories.user import UserRepository
from src.domain.services.user import UserService
from src.providers.domain.repositories.user import get_user_repository


def get_user_service(repo: UserRepository = Depends(get_user_repository)) -> UserService:
    return UserService(repo)

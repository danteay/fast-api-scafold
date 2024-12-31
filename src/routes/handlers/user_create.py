from pydantic import BaseModel

from src.domain.services import UserService


class UserCreateRequest(BaseModel):
    name: str
    email: str


def create_user(request: UserCreateRequest, user_service: UserService):
    return user_service.create_user(request.name, request.email)

from fastapi import HTTPException

from src.domain.services import UserService


def get_user(user_id: int, user_service: UserService):
    user = user_service.get_user(user_id)

    if user is None:
        raise HTTPException(status_code=404, detail="User not found")

    return user

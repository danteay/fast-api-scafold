from fastapi import APIRouter, Depends

from src.providers.domain.services import get_user_service
from src.routes.handlers.user_create import create_user, UserCreateRequest
from src.routes.handlers.user_get import get_user
from src.infra.logger import log


router = APIRouter()


@router.get("/.health")
def health():
    log.info("Health check")
    return {"status": "ok"}


@router.post("/users")
def create_user_route(request: UserCreateRequest, user_service=Depends(get_user_service)):
    return create_user(request, user_service)


@router.get("/users/{user_id}")
def get_user_route(user_id: int, user_service=Depends(get_user_service)):
    return get_user(user_id, user_service)

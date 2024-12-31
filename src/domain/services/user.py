from src.models import User
from src.domain.repositories.user import UserRepository


class UserService:
    def __init__(self, repo: UserRepository):
        self.repo = repo

    def create_user(self, name: str, email: str) -> User:
        return self.repo.create(name, email)

    def get_user(self, user_id: int) -> User:
        return self.repo.get_by_id(user_id)

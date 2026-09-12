FROM python:3.11-slim

WORKDIR /app

# 安装 uv 包管理器
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 复制项目代码
COPY . .

# 使用 uv 同步安装 Python 依赖
RUN uv sync --frozen || uv sync

EXPOSE 9763

# 启动 Python 入口
CMD ["uv", "run", "main.py"]

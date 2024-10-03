build:
	docker compose up --build -d
	docker compose exec app cp .env.example .env
	docker compose exec app composer install
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan config:cache
	docker compose exec app php artisan migrate:refresh --seed
	docker compose exec app npm install
	docker compose exec app npm run dev
	docker ps
stop:
	docker compose stop
up:
	docker compose up -d
down:
	docker compose down	
dev:
	docker compose exec app npm run dev


# ROR TASK

## Local Development Setup

### Prerequisites

- Ruby (version 3.2.1)
- Rails (version 7.0.8)
- PostgreSQL (version  1.1)
- Redis (version 4.0) - Required only if using Sidekiq for background jobs

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Archana8360/ROR-task.git
    ```

2. **Install gem dependencies:**

    ```bash
    bundle install
    ```

3. **Database setup:**

    - Make sure PostgreSQL is running.
    - Create the database:

        ```bash
        rails db:create
        ```

    - Run database migrations:

        ```bash
        rails db:migrate
        ```

    - *(Optional)* Seed the database with sample data:

        ```bash
        rails db:seed
        ```

4. **Redis setup (for Sidekiq background jobs):**

    - Install Redis (if not already installed).
    - Start Redis server:

        ```bash
        redis-server
        ```

### Environment Variables

- Copy the example environment variables file:

    ```bash
    cp .env.example .env
    ```

- Update the `.env` file with your environment-specific values.

### Running the Application

1. **Start the Rails server:**

    ```bash
    rails server
    ```

2. **Access the application in your web browser at `http://localhost:3000`.**

### Running Sidekiq (Optional, for background jobs)

1. **Start the Sidekiq process:**

    ```bash
    bundle exec sidekiq
    ```

### Testing

- **Run tests:**

    ```bash
    rails test
    ```


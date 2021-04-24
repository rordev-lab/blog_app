module Admin
  class PostsController < AdminController
    before_action :set_post, only: %i[show edit update destroy]

    # GET /posts
    def index
      @posts = policy_scope(Post)
                .includes(:user)
                .order('posts.created_at DESC')
                .paginate(page: params[:page], per_page: 10)
    end

    # GET /posts/1
    def show
      @commnents = @post
                  .comments.order('comments.created_at DESC')
                  
      @post_preview = true
      render "posts/show", layout: "layouts/application"
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
      authorize @post
    end

    # POST /posts
    def create
      @post = current_user
              .posts.build(post_params)

      if @post.save
        redirect_to admin_posts_path, notice: 'Post was successfully created.'
      else
        render 'admin/posts/new', status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: 'Post was successfully updated.'
      else
        render 'admin/posts/new', status: :unprocessable_entity
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :subtitle, :body)
    end
  end
end

class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @order=params[:order].eql?(nil)?session[:order]:params[:order]
    session[:order] = @order
    @all_ratings=Movie.pluck(:rating).uniq
    if params[:ratings].eql?(nil) then
        if params[:commit]==("Refresh") then
              @filt = @all_ratings
        else
            if ! session[:ratings].eql?(nil) then
                  @filt= session[:ratings]
            else
                  @filt = @all_ratings
            end
        end
    else
        if params[:commit]==("Refresh") then
          @filt=params[:ratings].keys
        else
          if session[:ratings].eql?(nil) then
            @filt = @all_ratings
          else
            @filt= session[:ratings]
          end

        end

    end
    @movies = Movie.where("rating IN (?)",@filt).order(@order)
    session[:ratings] = @filt
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end

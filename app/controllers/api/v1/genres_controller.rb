# frozen_string_literal: true

module Api
  module V1
    class GenresController < ApplicationController
      before_action :authenticate_request
      before_action :set_genre, only: %i[show update destroy]

      def index
        genres = Genre.all
        json_response(genres: genres)
      end

      def create
        genre = Genre.new(genre_params)

        if genre.save
          response = { message: Message.record_created, genre: genre }
          json_response(response, :created)
        else
          json_response({ message: genre.errors.full_messages }, :bad_request)
        end
      end

      def show
        json_response(genre: @genre)
      end

      def update
        @genre.update(genre_params)
        json_response({ message: Message.record_updated, genre: @genre }, :ok)
      end

      def destroy
        @genre.destroy
        json_response({ message: Message.record_deleted }, :no_contect)
      end

      def set_genre
        @genre = Genre.find(params[:id])
      end

      def genre_params
        params.permit(:genre)
      end
    end
  end
end

class InstructorsController < ApplicationController

    def create
        instructor = Instructor.create(instructor_params)
        if instructor
            render json: instructor, status: :created
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end

    def index
        instructors = Instructor.all
        if instructors
            render json: instructors, status: :ok
        else
            render json: {error: 'No instructors found.'}, status: :not_found
        end
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            render json: instructor, status: :ok
        else
            render json: {error: 'Instructor not found.'}, status: :not_found
        end
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor, status: :created
        else
            render json: {error: 'Instructor not found.'}, status: :not_found
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            render json: {}
        else
            render json: {error: 'Instructor not found.'}, status: :not_found
        end
    end

    private

    def instructor_params
        params.permit(:name)
    end
end

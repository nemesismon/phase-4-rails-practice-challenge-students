class StudentsController < ApplicationController

    def create
        student = Student.create(student_params)
        if student
            render json: student, include: :instructor, status: :created
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end

    def index
        students = Student.all
        if student
            render json: students, status: :ok
        else 
            render json: {error: 'No students found.'}, status: :not_found
        end
    end

    def show
        student = Student.find_by(id: params[:id])
        if student
            render json: student, status: :ok
        else
            render json: {error: 'Student not found.'}, status: :not_found
    end

    def update
        student = Student.find_by(id: params[:id])
        if student
            student.update(student_params)
            render json: student, include: :instructor, status: :created
        else
            render json: {error: 'Student not found.'}, status: :not_found
        end
    end

    def destroy
        student. Student.find_by(id: params[:id])
        if student
            student.destroy
            render json: {}
        else
            render json: {error: 'Student not found.'}, status: :not_found
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
end

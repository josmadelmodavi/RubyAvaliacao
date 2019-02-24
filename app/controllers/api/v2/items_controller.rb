class Api::V2::ItemsController < ApplicationController
	before_action :find_itemvenda, only: [:show, :update, :destroy]

	def index
		itemVenda = ItemVenda.where(venda_id: params[:venda_id])
		render json: itemVenda, status: :ok
	end

	def create
		itemVenda = ItemVenda.new(items_params)

		if itemVenda.save
			render json: itemVenda, status: :created and return
		elsif itemVenda.has_nil_fields
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Item não cadastrado!', errors: itemVenda.errors}, status: error_status
	end

	def show
		if @itemVenda.nil?
			render json: {message: "Item não encontrado!"}, status: :not_found
		else
			render json: @itemVenda, status: :ok
		end
	end

	def update
		if @itemVenda.update(items_params)
			render json: @itemVenda, status: :ok and return
		elsif @itemVenda.has_nil_fields
			error_status = :bad_request
		elsif
			error_status = :unprocessable_entity
		end

		render json: {message: 'Item não atualizado!', errors: @itemVenda.errors}, status: error_status
	end

	def destroy
		if @itemVenda.nil?
			render json: {message: 'Item não encontrado!'}, status: :not_found
		else
			@itemVenda.destroy
		end
	end

	private
	def find_itemvenda
		@itemVenda = ItemVenda.find_by(id: params[:id], venda_id: params[:venda_id])
	end

	def items_params
		params.permit(:name, :valor, :quantity, :venda_id)
	end
end

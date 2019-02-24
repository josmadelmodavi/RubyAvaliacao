class Api::V2::VendasController < ApplicationController
	before_action :find_venda, only: [:show, :update, :destroy]

	#Teste de funcionamento
	def hello_world
		render json:{message: 'API V2 OK!'}
	end

	#def list
		#render json:Venda.all.order(id: :asc)
	#	vendas = Venda.all
	#	render json: vendas, status: :ok
	#end

	def index
		vendas = Venda.all
		render json: vendas, status: :ok
	end

	def create
		venda = Venda.new(vendas_params)

		if venda.save
			render json: venda, status: :created and return
		elsif venda.has_nil_fields
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Venda não finalizada!', errors: venda.errors}, status: error_status
	end

	#def find
	#	if @venda.nil?
	#		render json: {message: "Product not found"}, status: :not_found
	#	else
	#		render json: @venda, status: :ok
	#	end
	#end

	def show
		if @venda.nil?
			render json: {message: "Venda não encontrada!"}, status: :not_found
		else
			render json: @venda, status: :ok
		end
	end

	def update
		if @venda.update(vendas_params)
			render json: @venda, status: :ok and return
		elsif @venda.has_nil_fields
			error_status = :bad_request
		elsif
			error_status = :unprocessable_entity
		end

		render json: {message: 'Venda não atualizada!', errors: @venda.errors}, status: error_status
	end

	def destroy
		if @venda.nil?
			render json: {message: 'Venda não encontrada!'}, status: :not_found
		else
			@venda.destroy
		end
	end

	#def vendas_by_gasto
	#	@vendas = Venda.all
	#	render json: Venda.all

	#	@vendas do |venda|
			
	#	end
	#end

	private
	def find_venda
		@venda = Venda.find_by_id(params[:id])
	end

	def vendas_params
		params.permit(:consumerName)
	end
end

class ResumesController < ApplicationController
	# add_breadcrumb "home", :root_path
  # add_breadcrumb "new", :new_resume_path
  # add_breadcrumb "show", :resume_path
	def index   
			@resumes = Resume.all 
			# add_breadcrumb "index", :root_path
	 end   
			
	 def new 
			@categories  = Category.all
			@resume = Resume.new
			add_breadcrumb "new", :new_resume_path
	
	 end   
			
	 def create
	 # debugger 
	 		cat = Category.find(params[:resume][:id])
			# @resume = Resume.new(resume_params)
			@resume = cat.resumes.new(check: params["bike"].to_s+" " +  params["car"].to_s+" " + params["boat"].to_s+ " " +params["Music"].to_s+""+""+params["Sing"].to_s+""+ params["Watch"].to_s+""+params["male"].to_s + " " + params["female"].to_s+ " " +params["other"].to_s+""+params["Hockey"].to_s+ " "+ params["Football"].to_s+""+ params["other"].to_s+""+ params["Basketball"].to_s+""+ params["Baseball"].to_s+""+params["handball"].to_s , name: params[:resume][:name],attachment: params[:resume][:attachment])
			if @resume.save   
				 redirect_to resumes_path, notice: "Successfully uploaded."   
			else   
				 render "new"   
			end   
				 
	 end  

	 def create_check
			 
	 end 
	 def show
	 	# debugger
		@resume = Resume.find(params[:id])
	 	add_breadcrumb "show", :resume_path
	 end
			
	 def destroy   
			@resume = Resume.find(params[:id])   
			@resume.destroy   
			redirect_to resumes_path
			flash[:alert] = 'deleted Successfully'   
	 end   
			
	 private   
			def resume_params   
			params.require(:resume).permit(:name, :attachment)   
	 end   
end

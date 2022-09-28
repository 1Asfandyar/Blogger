# frozen_string_literal: true

# report controller
class ReportsController < ApplicationController
  def create
    authorize Report

    @report = current_user.reports.new(report_params)
    respond_to do |format|
      if @report.save
        format.html { redirect_back(fallback_location: posts_url, notice: t('.notice')) }
      else
        format.html { redirect_to home_path, alert: t('.alert') }
      end
    end
  end

  def index
    @reports = Report.all
  end

  def destroy
    @report = Report.destroy_report(current_user, params)
    authorize @report
    respond_to do |format|
      if @report.destroy
        format.html { redirect_back(fallback_location: posts_url, notice: t('.notice')) }
      else
        format.html { redirect_to home_path, alert: t('.alert') }
      end
    end
  end

  private

  def report_params
    params.permit(:reportable_id, :reportable_type)
  end
end

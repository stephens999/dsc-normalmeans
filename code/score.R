#' @title compute score for shrinkage DSC
#'
#' @description Outputs the RMSE and MAE of estimated beta values
#' @details None
#'
#' @param data
#' @param output
#'
#' @return score a list with
#' \item{RMSE}{root mean squared error of estimated beta values}
#' \item{MAE}{Median absolute error of estimated beta values}
#'
#'
score = function(data, output){
  if(is.numeric(output$beta_est)){
  return(list(RMSE=sqrt(mean((data$meta$beta-output$beta_est)^2)),
              MAE = median(abs(data$meta$beta-output$beta_est))))
  } else {return(list(RMSE=NA,MAE=NA))}
}

score2 = function(data, output){
  return(list(pi0 = data$meta$pi0,
              pi0_est = output$pi0_est))
}

score3 = function(data, output){
  return(c(S=pcdf_post(output$fitted.g,data$meta$beta,
              data$input$betahat,data$input$sebetahat,v=NULL)))
}

score_neg = function(data, output){
  return(c(S=get_np(output)))
}

score_pos = function(data, output){
  return(c(S=get_pp(output)))
}

score_fdr = function(data, output){ #for mixfdr output
  return(c(S=output$fdr))
}

score_lfsr = function(data, output){
  return(c(S=get_lfsr(output)))
}

score_lfdr = function(data, output){
  return(c(S=get_lfdr(output)))
}

score_betahat = function(data, output){
  return(c(S=data$input$betahat))
}

score_logLR = function(data,output){
  return(c(logLR=ashr::calc_logLR(output,data$input$betahat,data$input$sebetahat,NULL)))
}

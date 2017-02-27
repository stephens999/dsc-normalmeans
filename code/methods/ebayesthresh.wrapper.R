ebayesthresh.wrapper=function(input,args=NULL){
  res = do.call(EbayesThresh::ebayesthresh,
                args= c(list(x=input$betahat/input$sebetahat,prior="laplace", a=NA,threshrule="mean",sdev=1)))

  return(list(res=res, input=input))
}

ebayesthresh2beta_est = function(output){
  if(is.list(output)){
    return (list(beta_est=output$res*output$input$sebetahat))}
  else {return(list(beta_est=NA))}
}


dscr::source_dir("methods")

add_method(dsc_normalmeans,name="ash.n",fn =ash.wrapper,args=list(mixcompdist="normal"),outputtype = "ash_output")
add_method(dsc_normalmeans,name="ash.ns",fn =ash.wrapper,args=list(mixcompdist="normal",method="shrink"),outputtype = "ash_output")

add_method(dsc_normalmeans,name="bayes",fn=bayes.wrapper,gold_flag=TRUE,outputtype = "ash_output")
add_method(dsc_normalmeans,name="ebayesthresh",fn=ebayesthresh.wrapper,outputtype = "ebayesthresh_output")

add_method(dsc_normalmeans,name="ebnm",fn=ebnm.wrapper,outputtype = "ash_output")

#this is for new results as I update code - above is for original version of ebayesthresh
add_method(dsc_normalmeans,name="ebayesthresh-new",fn=ebayesthresh.wrapper,args=list(universalthresh=FALSE),outputtype = "ebayesthresh_output")
add_method(dsc_normalmeans,name="ebayesthresh-new-med",fn=ebayesthresh.wrapper,args=list(universalthresh=FALSE,threshrule="median"),outputtype = "ebayesthresh_output")


add_method(dsc_normalmeans,name="horseshoe",fn=horseshoe.wrapper,outputtype = "horseshoe_output")

#add_method(dsc_shrink,name="mixfdr.tnull", fn=mixfdr.wrapper, args = list(theonull=TRUE),outputtype = "mixfdr_output")
#add_method(dsc_shrink,name="mixfdr.enull", fn=mixfdr.wrapper, args = list(theonull=FALSE),outputtype = "mixfdr_output")



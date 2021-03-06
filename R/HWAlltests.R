HWAlltests <- function(x,verbose=FALSE) {
  # Does all tests for HWE and summarizes the results.
  out.nc <- HWChisq(x,cc=0)
  out.cc <- HWChisq(x,cc=0.5)
  out.lr <- HWLratio(x)
  out.ex.sel <- HWExact(x,pvaluetype="selome")
  out.ex.dos <- HWExact(x,pvaluetype="dost")
  out.ex.mid <- HWExact(x,pvaluetype="midp")
  chisqpval <- out.nc$pval
  chisqccpval <- out.cc$pval
  teststring <- c("Chi-square test:","Chi-square test with continuity correction:",
                  "Likelihood-ratio test:","Exact test with selome p-value:",
                  "Exact test with dost p-value:","Exact test with mid p-value:")
  pvals <- c(out.nc$pval,out.cc$pval,out.lr$pval,out.ex.sel$pval,out.ex.dos$pval,out.ex.mid$pval)
  stats <- c(out.nc$chisq,out.cc$chisq,out.lr$G2,NA,NA,NA)
  Res <- data.frame(stats,pvals)
  colnames(Res) <- c("Statistic","p-value")
  rownames(Res) <- teststring
  if(verbose) print(Res)
  return(Res)
}

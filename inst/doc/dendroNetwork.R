## ----flowchart_workflow, echo=FALSE, fig.width=5------------------------------
DiagrammeR::grViz("
digraph {
  # graph attributes
  graph [overlap = true]
  # node attributes
  node [shape = box,
        fontname = Helvetica,
        color = gray]
  # edge attributes
  edge [color = black]
  # node statements
  1 [label = 'Load data']
  2 [label = 'Create similarity table']
  3 [label = 'Create network using default settings']
  4 [label = 'Detect communities using the \n Girvan-Newman algorithm']
  5 [label = 'Detect communities using the \n Clique Percolation Method']
  # edge statements
  1 ->  2
  2 -> 3
  3 -> 4
  3 -> 5
  }
")

## ----network_hollstein_1980, fig.width=5--------------------------------------
library(dendroNetwork)
data(hol_rom) # 1
sim_table_hol <- sim_table(hol_rom) # 2
g_hol <- dendro_network(sim_table_hol) # 3
g_hol_gn <- gn_names(g_hol) # 4
g_hol_cpm <- clique_community_names(g_hol, k=3) # 4
hol_com_cpm_all <- find_all_cpm_com(g_hol) # 5
# plotting the graph in R
plot(g_hol)  
# better readable version
plot(g_hol, vertex.color="deepskyblue", vertex.size=15, vertex.frame.color="gray",
     vertex.label.color="darkslategrey", vertex.label.cex=0.8, vertex.label.dist=2) 


set.seed(1234)

mar_less_bottom <- c(2.1, 4.1, 4.1, 4.1)
mar_even <-        c(4.1, 4.1, 4.1, 4.1)
mar_more_bottom <- c(6.1, 4.1, 4.1, 4.1)

new_mgp <- c(3, 0.75, 0)

axis_label_size = 1.2
axis_label_vert_nudge <- 0.45

dat <- list("Cool dataset one" = rnorm(100, 0),
            "Cool dataset two" = rnorm(100, 4),
            "Another long name" = rnorm(100, 5),
            "Really really long" = rnorm(100, 4))

#### fig. 1

png("boxplot_labels_too_long.png", width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat)
dev.off()

#### fig. 2

png("boxplot_no_axes.png", width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
dev.off()

#### Fig. mgp sweep

label_nudge <- c(0, 1, 2, 1)
axis_nudge <- c(0, 1)

for (i in 1:length(axis_nudge)) {
    for (j in 1:length(label_nudge)) {
        fname <- paste("for_gifs/boxplot_mgp_sweep",
                       i,
                       j,
                       axis_nudge[i],
                       label_nudge[j],
                       "for_gif.png",
                       sep = "_")


        png(fname,
            width = 500,
            height = 500)
        par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)

        boxplot(dat, xaxt = "n", yaxt = "n")
        axis(side = 2, las = 2, mgp = c(3, label_nudge[j], axis_nudge[i]))

        text(cex = 1.5,
             x = 2.25, y = -0.7,
             pos = 4,
             paste("mgp = c(3, ",
                   label_nudge[j],
                   ", ",
                   axis_nudge[i],
                   ")",
                   sep = ""),
             family = "mono")

        dev.off()
    }
}

#### fig. 4 adding the axes

png("boxplot_with_axes.png", width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
dev.off()

#### fig

png("boxplot_with_x_axis_labels_clipped.png",
    width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
text(cex = axis_label_size,
     x = 1:length(dat),
     y = par("usr")[3],
     labels = names(dat))
dev.off()

#### fig

png("boxplot_with_x_axis_labels_not_clipped.png",
    width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
text(cex = axis_label_size,
     x = 1:length(dat),
     y = par("usr")[3],
     labels = names(dat),
     xpd = NA)
dev.off()

#### fig

png("boxplot_with_x_axis_labels_pushed_down.png",
    width = 500, height = 500)
par(mar = mar_less_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
text(cex = axis_label_size,
     x = 1:length(dat),
     y = par("usr")[3] - axis_label_vert_nudge,
     labels = names(dat),
     xpd = NA)
dev.off()

#### fig (this one has a different bottom axis)

png("boxplot_with_x_axis_labels_rotated.png",
    width = 500, height = 500)
par(mar = mar_even, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
text(cex = axis_label_size,
     x = 1:length(dat),
     y = par("usr")[3] - axis_label_vert_nudge,
     labels = names(dat),
     xpd = NA,
     srt = 35)
dev.off()

## Make the pngs for the adj sweep gif

adjs <- c(
    seq(0.5, 0.9, by = 0.1),
    seq(1, 0.6, by = -0.1),
    seq(0.5, 0.1, by = -0.1),
    seq(0, 0.5, by = 0.1)
)

for (i in 1:length(adjs)) {
    adj <- adjs[i]
    fname <- paste("for_gifs/boxplot_adj_sweep",
                   sprintf("%02d", i),
                   "for_gif.png",
                   sep = "_")

    png(fname,
        width = 500,
        height = 500)
    par(mar = mar_more_bottom, lwd = 2, cex.axis = axis_label_size)
    boxplot(dat, xaxt = "n", yaxt = "n")
    axis(side = 1, labels = FALSE)
    axis(side = 2, las = 2, mgp = new_mgp)

    text(cex = axis_label_size,
         x = 1:length(dat),
         y = par("usr")[3] - axis_label_vert_nudge,
         labels = names(dat),
         xpd = NA,
         srt = 35,
         adj = adj)

    ## Draw the adj param on the plot
    text(cex = 1.5,
         x = 2.25, y = -0.7,
         pos = 4,
         paste("adj =", adj),
         family = "mono")

    dev.off()
}

## Fig. srt and adj sweep

angles <- c(0, 22.5, 45, 22.5)

adjs <- c(
    seq(0.5, 0.9, by = 0.1),
    seq(1, 0.6, by = -0.1),
    seq(0.5, 0.1, by = -0.1),
    seq(0, 0.5, by = 0.1)
)

idx <- -1
for (j in 1:length(angles)) {

    for (i in 1:length(adjs)) {
        idx <- idx + 1
        angle <- angles[j]
        adj <- adjs[i]
        fname <- paste("for_gifs/boxplot_srt_adj_sweep",
                       sprintf("%02d", idx),
                       "for_gif.png",
                       sep = "_")

        png(fname,
            width = 500,
            height = 500)
        par(mar = mar_more_bottom, lwd = 2, cex.axis = axis_label_size)
        boxplot(dat, xaxt = "n", yaxt = "n")
        axis(side = 1, labels = FALSE)
        axis(side = 2, las = 2, mgp = new_mgp)

        text(cex = axis_label_size,
             x = 1:length(dat),
             ## Draw labels at the bottom of the chart.
             y = par("usr")[3] - axis_label_vert_nudge,
             labels = names(dat),
             ## Change the clipping region to allow labels off the
             ## bottom of the chart.
             xpd = NA,

             ## Adjust label rotation
             srt = angle,

             adj = adj)

        ## Draw the adj param on the plot
        text(cex = 1.5,
             x = 2.25, y = -0.7,
             pos = 4,
             paste("srt =", sprintf("%*.1f", 4, angle),
                   "\nadj =", sprintf("%*.1f", 4, adj)),
             family = "mono")

        dev.off()
    }
}

#### final chart

png("boxplot_final.png",
    width = 500,
    height = 500)
par(mar = mar_more_bottom, lwd = 2, cex.axis = axis_label_size)
boxplot(dat, xaxt = "n", yaxt = "n")
axis(side = 1, labels = FALSE)
axis(side = 2, las = 2, mgp = new_mgp)
text(cex = axis_label_size,
     x = 1:length(dat),
     y = par("usr")[3] - axis_label_vert_nudge,
     labels = names(dat),
     xpd = NA,
     srt = 35,
     adj = 0.965)
dev.off()

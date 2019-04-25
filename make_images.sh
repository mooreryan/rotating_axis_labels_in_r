time convert -delay 50 -loop 0 for_gifs/boxplot_mgp_sweep_*png boxplot_mgp_sweep.gif
time gifsicle --optimize --colors=8 --no-extensions -o boxplot_mgp_sweep.optimized.gif boxplot_mgp_sweep.gif
mv boxplot_mgp_sweep.optimized.gif boxplot_mgp_sweep.gif

time convert -delay 20 -loop 0 for_gifs/boxplot_adj_sweep*for_gif.png boxplot_adj_sweep.gif
time gifsicle --optimize --colors=8 --no-extensions -o boxplot_adj_sweep.optimized.gif boxplot_adj_sweep.gif
mv boxplot_adj_sweep.optimized.gif boxplot_adj_sweep.gif

time convert -delay 15 -loop 0 for_gifs/boxplot_srt_adj_sweep*for_gif.png boxplot_srt_adj_sweep.gif
time gifsicle --optimize --colors=8 --no-extensions -o boxplot_srt_adj_sweep.optimized.gif boxplot_srt_adj_sweep.gif
mv boxplot_srt_adj_sweep.optimized.gif boxplot_srt_adj_sweep.gif

# Now reduce the size of the PNGs
for f in *.png; do
    convert $f -type GrayScale -depth 8 $f.small
    mv $f.small $f
done

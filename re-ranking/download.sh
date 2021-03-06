gs=gs://cfdaclip-tmp2/train.canard.rewrite.text_pair.pred/train.canard.rewrite.top1000.monot5
for file in tlogits flogits;do
    echo Downloading prediction ${file} ... in ${gs}
    for split in {00..63};do
        gsutil cp ${gs}${split}.${file} ./
    done
    echo Merge all the ${file} into one file
    cat train.canard.rewrite.top1000.monot5??.${file} > ${file}
    rm train.canard.rewrite.top1000.monot5??.${file}
    echo Done
done

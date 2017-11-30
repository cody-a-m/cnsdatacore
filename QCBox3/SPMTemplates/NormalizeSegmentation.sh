#!/bin/bash

study_image_id=$1

tempdir=$(mktemp --directory --tmpdir=/dev/shm/spm)

normalization_matrix=$(ls -1 /data/NIFTI/$study_image_id/*_seg_sn.mat) || exit
c1image=$(ls -1 /data/NIFTI/$study_image_id/c1*.nii) || exit
c2image=$(ls -1 /data/NIFTI/$study_image_id/c2*.nii) || exit
c3image=$(ls -1 /data/NIFTI/$study_image_id/c3*.nii) || exit

echo "spm('defaults', 'FMRI');
spm_jobman('initcfg');
clear matlabbatch

matlabbatch{1}.spm.spatial.normalise.write.subj.matname = {'"$normalization_matrix"'};
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {
                                                            '"$c1image",1'
                                                            '"$c2image",1'
                                                            '"$c3image",1'
                                                            };
matlabbatch{1}.spm.spatial.normalise.write.roptions.preserve = 0;
matlabbatch{1}.spm.spatial.normalise.write.roptions.bb = [-78 -112 -50
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.roptions.vox = [2 2 2];
matlabbatch{1}.spm.spatial.normalise.write.roptions.interp = 1;
matlabbatch{1}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.normalise.write.roptions.prefix = 'w';

spm_jobman('run',matlabbatch);
exit" > $tempdir/spm_jobfile.m

pushd $tempdir
matlab -nodesktop -nosplash -nodisplay -r 'spm_jobfile'


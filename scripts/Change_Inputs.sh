#!/bin/bash

Angle_array=(45)
#Strain_array=(0.001 1 10 30 50 70 90 100 125 150 175 200 250 300 350)
#Strain_array=(0 118.379 150)
#Strain_array=(0 70.7365 150)
Strain_array=(0)
alpha_scale_array=(0)
B1_scale_array=(0)

Base_File='Base_Starters_Input.txt'

for Angle_element in "${Angle_array[@]}"
do
    for Strain_element in "${Strain_array[@]}"
    do
        for Alpha_Scale_element in "${alpha_scale_array[@]}"
        do
            for B1_Scale_element in "${B1_scale_array[@]}"
            do
                New_File="Angle=${Alpha_Scale_element}deg_StrainEo=${Strain_element}ppm_Phase=0deg_B1=${B1_Scale_element}x_alpha=${Alpha_Scale_element}x.txt"
                echo "$New_File"
                cp $Base_File $New_File
                sed -i 's/'Pump_Scale:=0'/'Pump_Scale:=${Strain_element}'/g' $New_File
                sed -i 's/'Angle:=0'/'Angle:=${Angle_element}'/g' $New_File
                sed -i 's/'Alpha_Scale:=0'/'Alpha_Scale:=${Alpha_Scale_element}'/g' $New_File
                sed -i 's/'B1_Scale:=0'/'B1_Scale:=${B1_Scale_element}'/g' $New_File
                #sed -i 's/'Starter_HalfSize_Angle=0'/'Starter_HalfSize_Angle=${Angle_array[index]}'/g' $New_File
            done
        done
    done
done

my_array=*.txt

Base_File='Job_Template.sh'
Base_File_Begin='RunMe_'
Base_File_End='.sh'

CURRENT_DIRECTORY=$(pwd)

for element in ${my_array[@]}
do echo "${element%%.txt}"
New_File="$Base_File_Begin${element%%.txt}$Base_File_End"
cp $Base_File $New_File

sed -i 's/'FILENAME'/'$element'/1' $New_File
sed -i "s/DIRECTORY/${CURRENT_DIRECTORY//\//\\/}/g" $New_File
done

sauce_config="SAUCE_USERNAME=${1} SAUCE_ACCESS_KEY=${2}"
magento_config="MAGENTO_USERNAME=${3} MAGENTO_PASSWORD=${4}"
system="SYSTEM=${5}"
shop="SHOP=${6}"
country="COUNTRY=${7}"

features_folder_path="features/shops/${6}/features/"
support_folder_path="features/shops/${6}/support/"
step_definitions_folder_path="features/shops/${6}/step_definitions/"
default_support_folder_path="features/support/"

folder_structure_config="$features_folder_path -r $support_folder_path -r $default_support_folder_path -r $step_definitions_folder_path"

config="$sauce_config $magento_config $system $shop $country $folder_structure_config"


echo "----------------"
echo "# System:  ${5}"  
echo "# Shop:    ${6}"
echo "# Country: ${7}"
echo "----------------"

if [ $# = 8 ] ; 
  then
    cucumber $config -t ${8}
elif [ $# = 7 ] ;
  then
    cucumber $config
else
    echo "Statement_Error: Wrong Syntax of call!"
    echo "Syntax:          <SAUCE_USERNAME><SAUCE_ACCESS_KEY><MAGENTO_USERNAME><MAGENTO_PASSWORD><SYSTEM><SHOP><COUNTRY>(<FEATURE_TAG>)"
    echo "Example:         sh run_cucumer.sh s_username s_access_key m_username m_password int vega de @search"
fi
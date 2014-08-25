<?php
if(!isset($_GET['image']) || !isset($_GET['movie']))
	  die("Missing arguments");
	  
$db = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.142.1.101)(PORT = 1521)))(CONNECT_DATA=(SID=orcl)))"; 
if(!($connection = oci_connect("maxux_cb","maxux_cb",$db)))
	die(oci_error());


$image = file_get_contents($_GET['image']);
echo strlen($image)." bytes\n";

$sql = "BEGIN :image := SGBDCB.Image('".$_GET['movie']."'); END;";
$result = oci_parse($connection, $sql);

$blob = oci_new_descriptor($connection, OCI_D_LOB);
oci_bind_by_name($result, ":image", $blob, -1, OCI_B_BLOB);
oci_execute($result, OCI_DEFAULT) or die(print_r(oci_error($result)));

if(!$blob->save($image))
	  oci_rollback($connection);
	  
else oci_commit($connection);

oci_free_statement($result);
$blob->free();

$sql = "BEGIN SGBDCB.ImageACK('".$_GET['movie']."'); END;";
$result = oci_parse($connection, $sql);
oci_execute($result, OCI_DEFAULT) or die(print_r(oci_error($result)));
?>

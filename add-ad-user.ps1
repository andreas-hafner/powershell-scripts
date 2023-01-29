# Dieses Skript importiert das ActiveDirectory-Modul, setzt die Variablen für den Benutzernamen und das Passwort des neuen Benutzers sowie die OU,
# in der der Benutzer erstellt werden soll. Dann wird ein neues Benutzerobjekt erstellt und verschiedene Eigenschaften wie
# Vorname, Nachname, Anzeigename, E-Mail und Pfad festgelegt. Schließlich werden die Änderungen in Active Directory gespeichert.
# Es ist wichtig zu beachten, dass Sie über die erforderlichen Berechtigungen in Active Directory verfügen müssen und das Skript 
# auf einem Computer ausgeführt werden muss, auf dem die Active Directory Domain Services-Rolle installiert ist.

Import-Module ActiveDirectory

$username = "neuerbenutzer"
$password = "P@sswort1"
$ou = "OU=Benutzer,DC=domain,DC=local"

$user = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$ou")
$user.Username = "$username"
$user.Password = "$password"
$user.Firstname = "John"
$user.Lastname = "Doe"
$user.Displayname = "John Doe"
$user.Email = "johndoe@domain.com"
$user.Path = "LDAP://$ou"
$user.CommitChanges()

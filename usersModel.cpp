#include "usersModel.h"

Users::Users(QObject *parent)
    : QObject{parent}
{

}
void Users::login(const QString &username, const QString &password)
{
    QResource resource(":/json/users.json");
    QString filename = resource.fileName();
    QFile file(filename);
    if(!file.open(QFile::ReadOnly | QFile::Text)){
        qDebug()<<"Open file failed" ;
    }
    QByteArray fileData = file.readAll();
    file.close();
    QJsonParseError parseError;
    QJsonDocument usersJsonDoc = QJsonDocument::fromJson(fileData, &parseError);
    if(parseError.error != QJsonParseError::NoError){
        qDebug()<<"Failed to parse the users.json data";
    }
    QJsonArray Users = usersJsonDoc.array();
    for(int i = 0; i < Users.size(); ++i){
        if(Users[i].isObject()){
            QJsonObject User_element = Users[i].toObject();
            if(User_element.value("user")==username && User_element.value("pwd")==password){
                emit loginSuccessful();
                return;
            }
        }
    }
    if(username.isEmpty() || password.isEmpty()){
        emit loginFailed("Both fields are required");
    }else
        emit loginFailed("Username or password incorrect!");
}


void Users::registerUser(const QString &username, const QString &password)
{
    QString filePath = ":/json/users.json";
    QFile file(filePath);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "Failed to write in the file: " << file.errorString();
        return;
    }

    QByteArray fileData = file.readAll();
    file.close();

    QJsonParseError parseError;
    QJsonDocument usersJsonDoc = QJsonDocument::fromJson(fileData, &parseError);
    if (parseError.error != QJsonParseError::NoError)
    {
        qDebug() << "Failed to parse the users.json data";
        return;
    }

    QJsonArray usersArray = usersJsonDoc.array();

    // Check if the user already exists
    for (const QJsonValue& userValue : usersArray)
    {
        if (userValue.isObject())
        {
            QJsonObject userObject = userValue.toObject();
            if (userObject.value("user") == username)
            {
                emit registrationFailed("Username already exists");
                return;
            }
        }
    }
    if(username.isEmpty() || password.isEmpty()){
        emit registrationFailed("Both fields are required");
    }

    // Create a new user object
    QJsonObject newUser;
    newUser.insert("user", username);
    newUser.insert("pwd", password);
    usersArray.append(newUser);

    // Update the JSON document with the new user
    usersJsonDoc.setArray(usersArray);

    // Open the file in write mode
    if (!file.open(QIODevice::NewOnly | QIODevice::WriteOnly | QIODevice::Text))
    {
        qDebug() << "Failed to open file for writing: " << file.errorString();
        return;
    }

    // Write the updated JSON document to the file
    qint64 bytesWritten = file.write(usersJsonDoc.toJson());
    if (bytesWritten == -1)
    {
        qDebug() << "Failed to write to file: " << file.errorString();
    }

    file.close();

    emit registrationSuccessful();
}


QString Users::getUsername() const
{
    return username;
}

void Users::setUsername(const QString &newUsername)
{
    if (username != newUsername) {
        username = newUsername;
        emit usernameChanged();
    }
}

QString Users::getPassword() const
{
    return password;
}

void Users::setPassword(const QString &newPassword)
{
    if (password != newPassword) {
        password = newPassword;
        emit passwordChanged();
    }
}

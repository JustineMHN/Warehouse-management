#ifndef USERSMODEL_H
#define USERSMODEL_H

#include <QObject>
#include <QResource>
#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>
#include <QFile>
#include <QList>
#include <QByteArray>
#include <QLockFile>


class Users : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ getUsername WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwordChanged)
    //Q_PROPERTY(void login READ login CONSTANT)

public:
    explicit Users(QObject *parent = nullptr);
    Q_INVOKABLE void login(const QString &username, const QString &password);
    Q_INVOKABLE void registerUser(const QString &username, const QString &password);

    QString getUsername() const;
    void setUsername(const QString &newUsername);

    QString getPassword() const;
    void setPassword(const QString &newPassword);

signals:
    void loginSuccessful();
    void loginFailed(const QString &error);
    void registrationSuccessful();
    void registrationFailed(const QString &error);
    void usernameChanged();
    void passwordChanged();

private:
    QString username;
    QString password;

};

#endif // USERSMODEL_H

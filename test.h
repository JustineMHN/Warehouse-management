#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QVariant>
#include <QRandomGenerator>
#include <QString>
#include <QDebug>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);
    QString getName();
    int getCgpe();
    QString getResult();
signals:
    void status(QVariant data);
    void nameChanged(const QString name);
    void cgpeChanged(const QVariant cgpe);
    void resultChecked(const QString result);
public slots:
    void works(QVariant);
    void setName(QString);
    void setCgpe(QVariant);
    void setResult();
private:
    QString s_name;
    QString s_result;
    int s_cgpe;
};

#endif // TEST_H

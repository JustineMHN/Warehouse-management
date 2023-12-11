#ifndef CATEGORYMODEL_H
#define CATEGORYMODEL_H

#include <QObject>

class Category : public QObject
{
    Q_OBJECT
public:
    explicit Category(QObject *parent = nullptr);

signals:

};

#endif // CATEGORYMODEL_H

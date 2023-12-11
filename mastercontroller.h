#ifndef MASTERCONTROLLER_H
#define MASTERCONTROLLER_H

#include <QObject>
#include "NavigationController.h"
#include "usersModel.h"
#include "productModel.h"
#include "categoryModel.h"


class MasterController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(NavigationController *ui_navigationController READ navigationController CONSTANT)
    Q_PROPERTY(QString ui_welcomeMessage READ welcomeMessage CONSTANT)
    Q_PROPERTY(Users *ui_user READ user CONSTANT)
    Q_PROPERTY(Product *ui_product READ product CONSTANT)

public:
    explicit MasterController(QObject *parent = nullptr);

    NavigationController *navigationController() const;
    const QString &welcomeMessage() const;
    Users *user() const;

    Product *product() const;

private:
    NavigationController* m_navigationController;
    const QString& m_welcomeMessage = "Welcome to Warehouse Management System";
    Users *m_user;
    Product *m_product;


signals:

};

#endif // MASTERCONTROLLER_H

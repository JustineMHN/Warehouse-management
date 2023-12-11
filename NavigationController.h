#ifndef NAVIGATIONCONTROLLER_H
#define NAVIGATIONCONTROLLER_H

#include <QObject>
#include "productModel.h"

class NavigationController : public QObject
{
    Q_OBJECT

public:
    explicit NavigationController(QObject* parent = nullptr): QObject(parent){}

signals:
    void goAddProductView();
    void goCategoryView();
    void goDashboardView();
    void goEditProductView(Product& product);
    void goFindProductView();
    void goLoginView();
    void goRegisterView();
};

#endif // NAVIGATIONCONTROLLER_H

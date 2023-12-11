#include "mastercontroller.h"

MasterController::MasterController(QObject *parent)
    : QObject{parent}
{
    m_navigationController = new NavigationController(this);
    m_user = new Users(this);
    m_product = new Product(this);
}

NavigationController *MasterController::navigationController() const
{
    return m_navigationController;
}

const QString &MasterController::welcomeMessage() const
{
    return m_welcomeMessage;
}

Users *MasterController::user() const
{
    return m_user;
}

Product *MasterController::product() const
{
    return m_product;
}

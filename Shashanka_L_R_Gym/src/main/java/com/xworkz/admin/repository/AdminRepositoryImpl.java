package com.xworkz.admin.repository;

import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.entity.Followuptrackdetailsentity;
import com.xworkz.admin.entity.RegistrationEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class AdminRepositoryImpl implements AdminRepository {
    @Autowired
    EntityManagerFactory entityManagerFactory;

    AdminRepositoryImpl() {
        log.info("AdminRepositoryImplCreated");
    }

    @Override
    public AdminEntity findByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("getPersonEntitylistbyemailforResetpassword");
            query.setParameter("email", email);

            List<AdminEntity> result = query.getResultList();
            transaction.commit();

            if (!result.isEmpty()) {
                return result.get(0);
            }
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean update(AdminEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean saveEnquiriesData(EnquiryEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<EnquiryEntity> findAllEnquiries() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetEnquiredList");
            List<EnquiryEntity> result = query.getResultList();
            transaction.commit();
            return result;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public EnquiryEntity findEnquiryById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("getEnquiredListById");
            query.setParameter("id", id);

            List<EnquiryEntity> result = query.getResultList();
            transaction.commit();

            if (!result.isEmpty()) {
                return result.get(0);
            }
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean update(EnquiryEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean saveRegisterdData(RegistrationEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<EnquiryEntity> findFilteredEnquiries(String search) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetEnquiredListForSorting");
            query.setParameter("search", "%" + search + "%");

            List<EnquiryEntity> result = query.getResultList();
            transaction.commit();
            return result;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean updateregdata(RegistrationEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public RegistrationEntity findregistrationbyid(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("getRegisteredListById");
            query.setParameter("id", id);

            List<RegistrationEntity> result = query.getResultList();
            transaction.commit();

            if (!result.isEmpty()) {
                log.info("found registration by id");
                return result.get(0);
            }
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public List<RegistrationEntity> findallregistration() {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetRegisteredList");
            List<RegistrationEntity> result = query.getResultList();
            transaction.commit();
            return result;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }


    @Override
    public long getCountofName(String name) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("getEnquiryEntitycountbyname");
            query.setParameter("name", name);

            long count = (long) query.getSingleResult();
            transaction.commit();

            System.out.println("Count for name: " + count);
            return count;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return 0;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean saveFollowupDetails(Followuptrackdetailsentity followuptrackdetailsentity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            entityManager.persist(followuptrackdetailsentity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            System.err.println("Error saving follow-up details: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }


    @Override
    public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetFollowupDetailsByEnquiryId");
            query.setParameter("enquiryId", enquiryId);

            List<Followuptrackdetailsentity> resultList = query.getResultList();

            query.getResultList();
            transaction.commit();
            return resultList;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            entityManager.close();
        }
    }

}

User.joins("LEFT OUTER JOIN questions
            ON users.id = questions.user_id
            ")